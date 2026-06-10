	.syntax unified
	.set sub_803A8F0, 0x0803A8F0 + 1
	.set sub_803BA10, 0x0803BA10 + 1
	.section .text.sub_803CC28, "ax", %progbits
@ sub_803CC28 @ JP 0x0803CC28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803CC28
	.thumb_func
sub_803CC28:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r7, _0803CC68 @ =0x030017C8
	ldr r0, [r7]
	ldr r0, [r0, #4]
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_803A8F0
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803CC5A
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r7]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_803BA10
_0803CC5A:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CC68: .4byte 0x030017C8

