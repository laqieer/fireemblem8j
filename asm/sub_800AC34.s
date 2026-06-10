	.syntax unified
	.section .text.sub_800AC34, "ax", %progbits
@ sub_800AC34 @ JP 0x0800AC34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800AC34
	.thumb_func
sub_800AC34:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r2, #0
	adds r7, r3, #0
	lsls r1, r1, #0x10
	asrs r3, r1, #0x10
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r4, r0, #0xc
	ldr r1, [r6]
	cmp r1, r4
	bge _0800AC58
	movs r0, #0
	str r0, [r7]
	str r4, [r6]
	movs r0, #2
	rsbs r0, r0, #0
	b _0800ACA0
_0800AC58:
	lsls r0, r3, #1
	adds r0, r0, r5
	subs r0, #2
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r2, r0, #0xc
	cmp r1, r2
	ble _0800AC74
	subs r0, r3, #1
	str r0, [r7]
	str r2, [r6]
	movs r0, #2
	rsbs r0, r0, #0
	b _0800ACA0
_0800AC74:
	movs r3, #0
	cmp r4, r1
	bgt _0800AC80
	movs r4, #2
	ldrsh r0, [r5, r4]
	b _0800AC96
_0800AC80:
	adds r3, #1
	lsls r0, r3, #1
	adds r2, r0, r5
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #0xc
	ldr r1, [r6]
	cmp r0, r1
	bgt _0800AC80
	movs r4, #2
	ldrsh r0, [r2, r4]
_0800AC96:
	lsls r0, r0, #0xc
	cmp r0, r1
	blt _0800AC80
	str r3, [r7]
	movs r0, #0
_0800ACA0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

