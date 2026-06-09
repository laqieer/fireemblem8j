	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8037FA8, 0x08037FA8 + 1
	.set sub_80389CC, 0x080389CC + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_8038EB0, "ax", %progbits
@ sub_8038EB0 @ JP 0x08038EB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8038EB0
	.thumb_func
sub_8038EB0:
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r0, _08038F0C @ =0x03001798
	ldr r2, _08038F10 @ =0x04000003
	add r1, sp, #8
	bl sub_80D6370
	add r0, sp, #8
	bl sub_8037FA8
	adds r5, r0, #0
	bl sub_8000CD8
	ldr r1, _08038F14 @ =0x0202BCEC
	ldr r1, [r1, #4]
	subs r0, r0, r1
	movs r1, #0x3c
	bl __umodsi3
	movs r4, #1
	cmp r0, #0x1d
	bls _08038EDE
	movs r4, #0
_08038EDE:
	ldr r0, _08038F18 @ =0x020039C8
	ldr r1, _08038F1C @ =0x080DCD04
	adds r2, r1, #0
	adds r2, #0x20
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, #0x21
	movs r3, #0
	ldrsb r3, [r1, r3]
	movs r1, #2
	str r1, [sp]
	str r4, [sp, #4]
	adds r1, r5, #0
	bl sub_80389CC
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08038F0C: .4byte 0x03001798
_08038F10: .4byte 0x04000003
_08038F14: .4byte 0x0202BCEC
_08038F18: .4byte 0x020039C8
_08038F1C: .4byte 0x080DCD04

