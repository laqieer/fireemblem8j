	.syntax unified
	.set ApplyEnabledMapChanges, 0x0802E368 + 1
	.set ApplyWaterShadowsBmMap, 0x080192FC + 1
	.set BmMapInit, 0x0801947C + 1
	.set InitBaseTilesBmMap, 0x0801967C + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8019584, 0x08019584 + 1
	.set sub_80195E4, 0x080195E4 + 1
	.set sub_801973C, 0x0801973C + 1
	.section .text.sub_8019194, "ax", %progbits
@ sub_8019194 @ JP 0x08019194 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8019194
	.thumb_func
sub_8019194:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _08019250 @ =0x02001000
	adds r1, r4, #0
	bl sub_8019584
	adds r0, r4, #0
	bl sub_80195E4
	ldr r0, _08019254 @ =0x0202E4F0
	ldr r6, _08019258 @ =0x0202E4D4
	ldr r4, _0801925C @ =0x0202E4D0
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r7, #2
	ldrsh r3, [r4, r7]
	adds r1, r6, #0
	bl BmMapInit
	ldr r0, _08019260 @ =0x0202ECA8
	ldr r5, _08019264 @ =0x0202E4D8
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r7, #2
	ldrsh r3, [r4, r7]
	adds r1, r5, #0
	bl BmMapInit
	ldr r0, _08019268 @ =0x03000808
	ldr r1, _0801926C @ =0x0202E4DC
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl BmMapInit
	ldr r0, _08019270 @ =0x03000FC0
	ldr r1, _08019274 @ =0x0202E4E0
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl BmMapInit
	ldr r0, _08019278 @ =0x0202F460
	ldr r1, _0801927C @ =0x0202E4E4
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl BmMapInit
	ldr r0, _08019280 @ =0x0202FC18
	ldr r1, _08019284 @ =0x0202E4E8
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl BmMapInit
	ldr r0, _08019288 @ =0x020303D0
	ldr r1, _0801928C @ =0x0202E4EC
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl BmMapInit
	ldr r0, [r6]
	movs r1, #0
	bl sub_80194BC
	ldr r0, [r5]
	movs r1, #0
	bl sub_80194BC
	bl InitBaseTilesBmMap
	bl ApplyEnabledMapChanges
	bl sub_801973C
	ldr r0, _08019290 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x75
	bne _08019248
	bl ApplyWaterShadowsBmMap
_08019248:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019250: .4byte 0x02001000
_08019254: .4byte 0x0202E4F0
_08019258: .4byte 0x0202E4D4
_0801925C: .4byte 0x0202E4D0
_08019260: .4byte 0x0202ECA8
_08019264: .4byte 0x0202E4D8
_08019268: .4byte 0x03000808
_0801926C: .4byte 0x0202E4DC
_08019270: .4byte 0x03000FC0
_08019274: .4byte 0x0202E4E0
_08019278: .4byte 0x0202F460
_0801927C: .4byte 0x0202E4E4
_08019280: .4byte 0x0202FC18
_08019284: .4byte 0x0202E4E8
_08019288: .4byte 0x020303D0
_0801928C: .4byte 0x0202E4EC
_08019290: .4byte 0x0202BCEC

