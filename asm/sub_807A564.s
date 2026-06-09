	.syntax unified
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.set sub_807A4C8, 0x0807A4C8 + 1
	.section .text.sub_807A564, "ax", %progbits
@ sub_807A564 @ JP 0x0807A564 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807A564
	.thumb_func
sub_807A564:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r4, [sp, #0x14]
	movs r1, #0xc0
	lsls r1, r1, #4
	bl sub_80567B8
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, [r5, #0x5c]
	adds r1, r6, #0
	mov r2, r8
	bl sub_807A4C8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

