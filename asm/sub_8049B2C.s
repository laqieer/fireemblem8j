	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8042D6C, 0x08042D6C + 1
	.section .text.sub_8049B2C, "ax", %progbits
@ sub_8049B2C @ JP 0x08049B2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8049B2C
	.thumb_func
sub_8049B2C:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	mov r8, r1
	adds r4, r2, #0
	adds r6, r3, #0
	bl sub_8003CF8
	adds r0, r5, #0
	movs r1, #0x18
	movs r2, #2
	adds r3, r6, #0
	bl sub_8042D6C
	adds r4, #1
	lsls r4, r4, #5
	adds r4, #1
	add r4, r8
	lsls r4, r4, #1
	ldr r0, _08049B70 @ =0x02022CA8
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08049B70: .4byte 0x02022CA8

