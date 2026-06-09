	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.set sub_8056890, 0x08056890 + 1
	.set sub_8070F64, 0x08070F64 + 1
	.set sub_8070FE8, 0x08070FE8 + 1
	.set sub_8071054, 0x08071054 + 1
	.section .text.sub_8071EA0, "ax", %progbits
@ sub_8071EA0 @ JP 0x08071EA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071EA0
	.thumb_func
sub_8071EA0:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	cmp r7, #0
	blt _08071EF8
	ldr r1, [r6, #0x4c]
	ldr r5, [r6, #0x54]
	ldr r0, [r6, #0x5c]
	lsls r4, r7, #2
	adds r1, r4, r1
	ldr r2, [r1]
	movs r1, #1
	movs r3, #1
	bl sub_8070FE8
	ldr r0, [r6, #0x5c]
	adds r4, r4, r5
	ldr r1, [r4]
	bl sub_8071054
	cmp r7, #0x11
	bne _08071EE2
	ldr r0, _08071EF0 @ =0x086F4504
	movs r1, #0x20
	bl sub_80567E0
_08071EE2:
	cmp r7, #0x12
	bne _08071F10
	ldr r0, _08071EF4 @ =0x086F4524
	movs r1, #0x20
	bl sub_80567E0
	b _08071F10
	.align 2, 0
_08071EF0: .4byte 0x086F4504
_08071EF4: .4byte 0x086F4524
_08071EF8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r7, r0
	bne _08071F10
	ldr r0, [r6, #0x5c]
	bl sub_8070F64
	bl sub_8056214
	adds r0, r6, #0
	bl sub_8002DE4
_08071F10:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

