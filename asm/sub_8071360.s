	.syntax unified
	.set FillBGRect, 0x080732A0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_8056890, 0x08056890 + 1
	.set sub_8070F08, 0x08070F08 + 1
	.set sub_8070F64, 0x08070F64 + 1
	.set sub_8070FE8, 0x08070FE8 + 1
	.section .text.sub_8071360, "ax", %progbits
@ sub_8071360 @ JP 0x08071360 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071360
	.thumb_func
sub_8071360:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r7, #0
	ldr r0, [r4, #0x5c]
	bl sub_8070F08
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _080713C2
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r5, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0
	movs r3, #1
	bl sub_8070FE8
	cmp r5, #0
	bne _080713A4
	ldrh r0, [r6, #0xa]
	adds r0, #0x1f
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_080713A4:
	cmp r5, #1
	bne _080713B0
	ldrh r0, [r6, #0xa]
	adds r0, #0x50
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_080713B0:
	ldr r0, [r6, #0x14]
	adds r0, #0x3c
	ldrh r3, [r6, #0xc]
	str r7, [sp]
	movs r1, #2
	movs r2, #0x14
	bl FillBGRect
	b _080713DA
_080713C2:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _080713DA
	ldr r0, [r4, #0x5c]
	bl sub_8070F64
	bl sub_8056214
	adds r0, r4, #0
	bl sub_8002DE4
_080713DA:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

