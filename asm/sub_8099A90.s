	.syntax unified
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.section .text.sub_8099A90, "ax", %progbits
@ sub_8099A90 @ JP 0x08099A90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8099A90
	.thumb_func
sub_8099A90:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	bl sub_8003CF8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8003D90
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8003D84
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_8003F28
	adds r0, r4, #0
	mov r1, r8
	bl PutText
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

