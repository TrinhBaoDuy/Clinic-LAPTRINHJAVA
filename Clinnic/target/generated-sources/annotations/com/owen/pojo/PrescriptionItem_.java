package com.owen.pojo;

import com.owen.pojo.Medicine;
import com.owen.pojo.Prescription;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

<<<<<<< HEAD
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-15T13:10:33")
=======
@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-08-15T12:08:29")
>>>>>>> 880c7375185ff9e43759d691f5112f5fef3ca183
@StaticMetamodel(PrescriptionItem.class)
public class PrescriptionItem_ { 

    public static volatile SingularAttribute<PrescriptionItem, String> dosage;
    public static volatile SingularAttribute<PrescriptionItem, String> instructions;
    public static volatile SingularAttribute<PrescriptionItem, Prescription> prescriptionId;
    public static volatile SingularAttribute<PrescriptionItem, Integer> quantity;
    public static volatile SingularAttribute<PrescriptionItem, Medicine> medicineId;
    public static volatile SingularAttribute<PrescriptionItem, Integer> id;

}