(set-option :produce-unsat-cores true)

(set-logic QF_UF)
(declare-fun x1a () Bool)
(declare-fun x1b () Bool)
(declare-fun x1c () Bool)
(declare-fun x1d () Bool)
(declare-fun x1e () Bool)
(declare-fun x2a () Bool)
(declare-fun x2b () Bool)
(declare-fun x2c () Bool)
(declare-fun x2d () Bool)
(declare-fun x2e () Bool)
(declare-fun x3a () Bool)
(declare-fun x3b () Bool)
(declare-fun x3c () Bool)
(declare-fun x3d () Bool)
(declare-fun x3e () Bool)
(declare-fun x4a () Bool)
(declare-fun x4b () Bool)
(declare-fun x4c () Bool)
(declare-fun x4d () Bool)
(declare-fun x4e () Bool)
(declare-fun x5a () Bool)
(declare-fun x5b () Bool)
(declare-fun x5c () Bool)
(declare-fun x5d () Bool)
(declare-fun x5e () Bool)
(assert (let ((.def_0 (not x5e))) (let ((.def_1 (=> x5d .def_0))) (let ((.def_2 (or x5d x5e))) (let ((.def_3 (not .def_2))) (let ((.def_4 (=> x5c .def_3))) (let ((.def_5 (or x5c x5d x5e))) (let ((.def_6 (not .def_5))) (let ((.def_7 (=> x5b .def_6))) (let ((.def_8 (or x5b x5c x5d x5e))) (let ((.def_9 (not .def_8))) (let ((.def_10 (=> x5a .def_9))) (let ((.def_11 (and .def_10 .def_7 .def_4 .def_1))) (let ((.def_12 (or x5a x5b x5c x5d x5e))) (let ((.def_13 (and .def_12 .def_11))) (let ((.def_14 (not x4e))) (let ((.def_15 (=> x4d .def_14))) (let ((.def_16 (or x4d x4e))) (let ((.def_17 (not .def_16))) (let ((.def_18 (=> x4c .def_17))) (let ((.def_19 (or x4c x4d x4e))) (let ((.def_20 (not .def_19))) (let ((.def_21 (=> x4b .def_20))) (let ((.def_22 (or x4b x4c x4d x4e))) (let ((.def_23 (not .def_22))) (let ((.def_24 (=> x4a .def_23))) (let ((.def_25 (and .def_24 .def_21 .def_18 .def_15))) (let ((.def_26 (or x4a x4b x4c x4d x4e))) (let ((.def_27 (and .def_26 .def_25))) (let ((.def_28 (not x3e))) (let ((.def_29 (=> x3d .def_28))) (let ((.def_30 (or x3d x3e))) (let ((.def_31 (not .def_30))) (let ((.def_32 (=> x3c .def_31))) (let ((.def_33 (or x3c x3d x3e))) (let ((.def_34 (not .def_33))) (let ((.def_35 (=> x3b .def_34))) (let ((.def_36 (or x3b x3c x3d x3e))) (let ((.def_37 (not .def_36))) (let ((.def_38 (=> x3a .def_37))) (let ((.def_39 (and .def_38 .def_35 .def_32 .def_29))) (let ((.def_40 (or x3a x3b x3c x3d x3e))) (let ((.def_41 (and .def_40 .def_39))) (let ((.def_42 (not x2e))) (let ((.def_43 (=> x2d .def_42))) (let ((.def_44 (or x2d x2e))) (let ((.def_45 (not .def_44))) (let ((.def_46 (=> x2c .def_45))) (let ((.def_47 (or x2c x2d x2e))) (let ((.def_48 (not .def_47))) (let ((.def_49 (=> x2b .def_48))) (let ((.def_50 (or x2b x2c x2d x2e))) (let ((.def_51 (not .def_50))) (let ((.def_52 (=> x2a .def_51))) (let ((.def_53 (and .def_52 .def_49 .def_46 .def_43))) (let ((.def_54 (or x2a x2b x2c x2d x2e))) (let ((.def_55 (and .def_54 .def_53))) (let ((.def_56 (not x1e))) (let ((.def_57 (=> x1d .def_56))) (let ((.def_58 (or x1d x1e))) (let ((.def_59 (not .def_58))) (let ((.def_60 (=> x1c .def_59))) (let ((.def_61 (or x1c x1d x1e))) (let ((.def_62 (not .def_61))) (let ((.def_63 (=> x1b .def_62))) (let ((.def_64 (or x1b x1c x1d x1e))) (let ((.def_65 (not .def_64))) (let ((.def_66 (=> x1a .def_65))) (let ((.def_67 (and .def_66 .def_63 .def_60 .def_57))) (let ((.def_68 (or x1a x1b x1c x1d x1e))) (let ((.def_69 (and .def_68 .def_67))) (let ((.def_70 (=> x4e .def_0))) (let ((.def_71 (or x4e x5e))) (let ((.def_72 (not .def_71))) (let ((.def_73 (=> x3e .def_72))) (let ((.def_74 (or x3e x4e x5e))) (let ((.def_75 (not .def_74))) (let ((.def_76 (=> x2e .def_75))) (let ((.def_77 (or x2e x3e x4e x5e))) (let ((.def_78 (not .def_77))) (let ((.def_79 (=> x1e .def_78))) (let ((.def_80 (and .def_79 .def_76 .def_73 .def_70))) (let ((.def_81 (or x1e x2e x3e x4e x5e))) (let ((.def_82 (and .def_81 .def_80))) (let ((.def_83 (not x5d))) (let ((.def_84 (=> x4d .def_83))) (let ((.def_85 (or x4d x5d))) (let ((.def_86 (not .def_85))) (let ((.def_87 (=> x3d .def_86))) (let ((.def_88 (or x3d x4d x5d))) (let ((.def_89 (not .def_88))) (let ((.def_90 (=> x2d .def_89))) (let ((.def_91 (or x2d x3d x4d x5d))) (let ((.def_92 (not .def_91))) (let ((.def_93 (=> x1d .def_92))) (let ((.def_94 (and .def_93 .def_90 .def_87 .def_84))) (let ((.def_95 (or x1d x2d x3d x4d x5d))) (let ((.def_96 (and .def_95 .def_94))) (let ((.def_97 (not x5c))) (let ((.def_98 (=> x4c .def_97))) (let ((.def_99 (or x4c x5c))) (let ((.def_100 (not .def_99))) (let ((.def_101 (=> x3c .def_100))) (let ((.def_102 (or x3c x4c x5c))) (let ((.def_103 (not .def_102))) (let ((.def_104 (=> x2c .def_103))) (let ((.def_105 (or x2c x3c x4c x5c))) (let ((.def_106 (not .def_105))) (let ((.def_107 (=> x1c .def_106))) (let ((.def_108 (and .def_107 .def_104 .def_101 .def_98))) (let ((.def_109 (or x1c x2c x3c x4c x5c))) (let ((.def_110 (and .def_109 .def_108))) (let ((.def_111 (not x5b))) (let ((.def_112 (=> x4b .def_111))) (let ((.def_113 (or x4b x5b))) (let ((.def_114 (not .def_113))) (let ((.def_115 (=> x3b .def_114))) (let ((.def_116 (or x3b x4b x5b))) (let ((.def_117 (not .def_116))) (let ((.def_118 (=> x2b .def_117))) (let ((.def_119 (or x2b x3b x4b x5b))) (let ((.def_120 (not .def_119))) (let ((.def_121 (=> x1b .def_120))) (let ((.def_122 (and .def_121 .def_118 .def_115 .def_112))) (let ((.def_123 (or x1b x2b x3b x4b x5b))) (let ((.def_124 (and .def_123 .def_122))) (let ((.def_125 (not x5a))) (let ((.def_126 (=> x4a .def_125))) (let ((.def_127 (or x4a x5a))) (let ((.def_128 (not .def_127))) (let ((.def_129 (=> x3a .def_128))) (let ((.def_130 (or x3a x4a x5a))) (let ((.def_131 (not .def_130))) (let ((.def_132 (=> x2a .def_131))) (let ((.def_133 (or x2a x3a x4a x5a))) (let ((.def_134 (not .def_133))) (let ((.def_135 (=> x1a .def_134))) (let ((.def_136 (and .def_135 .def_132 .def_129 .def_126))) (let ((.def_137 (or x1a x2a x3a x4a x5a))) (let ((.def_138 (and .def_137 .def_136))) (let ((.def_139 (and .def_138 .def_124 .def_110 .def_96 .def_82 .def_69 .def_55 .def_41 .def_27 .def_13))) .def_139)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))



(assert (! (or x1a x2a) :named A))
(assert (! (or x2b x4b) :named B))
(assert (! x1c :named C))
(assert (! (or x2d x4d) :named D))

(check-sat)
(get-unsat-core)


(exit)


