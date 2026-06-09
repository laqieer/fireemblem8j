	.syntax unified
	.set InitText, 0x08003C8C + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.section .text.sub_8004374, "ax", %progbits
@ sub_8004374 @ JP 0x08004374 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8004374
	.thumb_func
sub_8004374:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	cmp r4, #0
	bne _0800438E
	mov r4, sp
	mov r0, sp
	ldr r1, [sp, #0x1c]
	bl InitText
_0800438E:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8003D84
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8003D90
	adds r0, r4, #0
	ldr r1, [sp, #0x20]
	bl sub_8003F28
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutText
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

