	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set _DivArm1, 0x0800BAD0 + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_80C3F84, "ax", %progbits
@ sub_80C3F84 @ JP 0x080C3F84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C3F84
	.thumb_func
sub_80C3F84:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2a
	ldrsh r1, [r7, r2]
	cmp r0, r1
	bge _080C3FE0
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	movs r2, #0x2a
	ldrsh r1, [r7, r2]
	adds r2, r7, #0
	adds r2, #0x40
	ldrb r2, [r2]
	bl _DivArm1
	adds r5, r0, #0
	movs r6, #0x80
	lsls r6, r6, #5
	ldr r0, [r7, #0x44]
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r6, #0
	bl sub_80D6378
	ldr r4, [r7, #0x30]
	adds r4, r4, r0
	ldr r0, [r7, #0x48]
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r6, #0
	bl sub_80D6378
	ldr r1, [r7, #0x34]
	adds r1, r1, r0
	ldr r0, _080C3FDC @ =0x03005270
	str r4, [r0, #8]
	str r1, [r0, #0xc]
	b _080C3FF0
	.align 2, 0
_080C3FDC: .4byte 0x03005270
_080C3FE0:
	ldr r0, _080C3FF8 @ =0x03005270
	ldr r1, [r7, #0x38]
	str r1, [r0, #8]
	ldr r1, [r7, #0x3c]
	str r1, [r0, #0xc]
	adds r0, r7, #0
	bl Proc_End
_080C3FF0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3FF8: .4byte 0x03005270

