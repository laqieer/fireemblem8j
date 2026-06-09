	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set CheckTalkFlag, 0x080069E0 + 1
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.set SetTalkFaceNoMouthMove, 0x080088C0 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8006980, 0x08006980 + 1
	.set sub_800D6A8, 0x0800D6A8 + 1
	.section .text.sub_8006A50, "ax", %progbits
@ sub_8006A50 @ JP 0x08006A50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006A50
	.thumb_func
sub_8006A50:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08006AB0 @ =0x085B9208
	bl Proc_Find
	cmp r0, #0
	bne _08006AF2
	ldr r0, _08006AB4 @ =0x085B9260
	bl Proc_Find
	cmp r0, #0
	bne _08006AF2
	movs r0, #4
	bl CheckTalkFlag
	cmp r0, #0
	bne _08006AC8
	ldr r0, _08006AB8 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _08006AC8
	bl sub_800D6A8
	ldr r0, _08006ABC @ =0x085B90D4
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	bl SetTalkFaceNoMouthMove
	adds r0, r4, #0
	bl Proc_End
	bl sub_8006980
	ldr r0, _08006AC0 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _08006AC4 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	movs r0, #3
	bl BG_EnableSyncByMask
	b _08006AF2
	.align 2, 0
_08006AB0: .4byte 0x085B9208
_08006AB4: .4byte 0x085B9260
_08006AB8: .4byte 0x085775CC
_08006ABC: .4byte 0x085B90D4
_08006AC0: .4byte 0x02022CA8
_08006AC4: .4byte 0x020234A8
_08006AC8:
	ldr r0, _08006AF8 @ =0x085B9188
	bl Proc_Find
	cmp r0, #0
	bne _08006AF2
	movs r0, #8
	bl CheckTalkFlag
	cmp r0, #0
	bne _08006AF2
	ldr r0, _08006AFC @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _08006AF2
	ldr r0, _08006B00 @ =0x085B90D4
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #0x12]
_08006AF2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006AF8: .4byte 0x085B9188
_08006AFC: .4byte 0x085775CC
_08006B00: .4byte 0x085B90D4

