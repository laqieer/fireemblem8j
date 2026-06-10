	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set InitText, 0x08003C8C + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_804F0EC, 0x0804F0EC + 1
	.section .text.sub_801B754, "ax", %progbits
@ sub_801B754 @ JP 0x0801B754 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801B754
	.thumb_func
sub_801B754:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	ldr r1, [r0, #0x2c]
	mov r8, r1
	ldr r4, [r0, #0x30]
	adds r1, r0, #0
	adds r1, #0x52
	ldrh r5, [r1]
	ldr r6, [r0, #0x54]
	add r0, sp, #4
	adds r1, r5, #0
	bl InitText
	add r0, sp, #4
	adds r1, r6, #0
	bl sub_8003F28
	adds r5, #2
	movs r0, #0
	str r0, [sp]
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #4
	bl sub_804F0EC
	adds r4, #1
	lsls r4, r4, #5
	adds r4, #1
	add r4, r8
	lsls r4, r4, #1
	ldr r0, _0801B7B4 @ =0x02022CA8
	adds r4, r4, r0
	add r0, sp, #4
	adds r1, r4, #0
	bl PutText
	movs r0, #3
	bl BG_EnableSyncByMask
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801B7B4: .4byte 0x02022CA8

