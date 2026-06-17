	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_800BC44, "ax", %progbits
@ CopyBgTiles @ JP 0x0800BC44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CopyBgTiles
	.thumb_func
CopyBgTiles:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r2, r2, #0x18
	mov r3, sp
	ldr r1, _0800BC80 @ =0x080DC55C
	ldm r1!, {r5, r6, r7}
	stm r3!, {r5, r6, r7}
	ldr r1, [r1]
	str r1, [r3]
	lsrs r0, r0, #0x16
	add r0, sp
	ldr r0, [r0]
	lsls r1, r4, #2
	add r1, sp
	ldr r1, [r1]
	lsrs r2, r2, #0xf
	bl sub_80D636C
	movs r0, #1
	lsls r0, r4
	bl BG_EnableSyncByMask
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BC80: .4byte 0x080DC55C

