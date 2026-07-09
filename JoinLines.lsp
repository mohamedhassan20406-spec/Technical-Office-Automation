(defun c:JJ ( / ss old_pedit )
  (prompt "\nSelect lines, arcs, or polylines to join: ")
  ;; تحديد العناصر المسموح باختيارها فقط
  (if (setq ss (ssget '((0 . "LINE,ARC,LWPOLYLINE"))))
    (progn
      ;; حفظ إعدادات البرنامج الحالية
      (setq old_pedit (getvar "PEDITACCEPT"))
      ;; تعديل الإعداد لقبول تحويل الخطوط إلى بولي لاين تلقائياً
      (setvar "PEDITACCEPT" 1)
      
      ;; تنفيذ أمر الدمج
      (command "_.pedit" "_m" ss "" "_j" "0.00" "")
      
      ;; استرجاع الإعدادات الأصلية
      (setvar "PEDITACCEPT" old_pedit)
      (princ "\nLines joined successfully into a polyline!")
    )
    (princ "\nNo valid objects selected.")
  )
  (princ)
)