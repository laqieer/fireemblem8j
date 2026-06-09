	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set Proc_Find, 0x08002DEC + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.section .text.sub_80995B8, "ax", %progbits
@ sub_80995B8 @ JP 0x080995B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80995B8
	.thumb_func
sub_80995B8:
	push {r4, r5, lr}
	ldr r0, _08099618 @ =0x08A94430
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08099610
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	lsls r0, r0, #5
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0809961C @ =0x02022CA8
	adds r0, r0, r1
	adds r5, r4, #0
	adds r5, #0x2b
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r2, #2
	movs r1, #9
	movs r3, #0
	bl j_TmFillRect
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	lsls r0, r0, #5
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08099620 @ =0x020234A8
	adds r0, r0, r1
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r2, #2
	movs r1, #9
	movs r3, #0
	bl j_TmFillRect
	movs r0, #3
	bl BG_EnableSyncByMask
_08099610:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08099618: .4byte 0x08A94430
_0809961C: .4byte 0x02022CA8
_08099620: .4byte 0x020234A8

