	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetItemUseDescId, 0x080172D8 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8008938, 0x08008938 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8029E8C, 0x08029E8C + 1
	.section .text.sub_809E6B4, "ax", %progbits
@ sub_809E6B4 @ JP 0x0809E6B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809E6B4
	.thumb_func
sub_809E6B4:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, _0809E724 @ =0x02013560
	adds r0, r4, #0
	bl sub_8003CF8
	adds r4, #8
	adds r0, r4, #0
	bl sub_8003CF8
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _0809E752
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	adds r0, r5, #0
	bl GetItemUseDescId
	adds r4, r0, #0
	ldr r0, _0809E728 @ =0x081F563C
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	cmp r4, #0
	beq _0809E752
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8029E8C
	cmp r0, #0
	beq _0809E730
	ldr r0, [sp]
	movs r1, #0
	bl sub_8003D90
	ldr r0, [sp, #4]
	movs r1, #0
	bl sub_8003D90
	adds r0, r4, #0
	bl sub_8009FA8
	adds r1, r0, #0
	ldr r2, _0809E72C @ =0x02023006
	mov r0, sp
	movs r3, #2
	bl sub_8008938
	b _0809E752
	.align 2, 0
_0809E724: .4byte 0x02013560
_0809E728: .4byte 0x081F563C
_0809E72C: .4byte 0x02023006
_0809E730:
	ldr r0, [sp]
	movs r1, #1
	bl sub_8003D90
	ldr r0, [sp, #4]
	movs r1, #1
	bl sub_8003D90
	adds r0, r4, #0
	bl sub_8009FA8
	adds r1, r0, #0
	ldr r2, _0809E760 @ =0x02023006
	mov r0, sp
	movs r3, #2
	bl sub_8008938
_0809E752:
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E760: .4byte 0x02023006

