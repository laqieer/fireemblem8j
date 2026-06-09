	.syntax unified
	.set LinkArenaBattleMap_ClearUnitSlots, 0x0804A2D0 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_804A2EC, 0x0804A2EC + 1
	.set sub_804A390, 0x0804A390 + 1
	.set sub_804A4A0, 0x0804A4A0 + 1
	.section .text.sub_804A508, "ax", %progbits
@ sub_804A508 @ JP 0x0804A508 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804A508
	.thumb_func
sub_804A508:
	push {lr}
	bl sub_804A4A0
	bl LinkArenaBattleMap_ClearUnitSlots
	bl sub_804A2EC
	ldr r0, _0804A538 @ =0x0202E4E4
	ldr r2, [r0]
	movs r1, #0
	ldr r0, _0804A53C @ =0x0202BCEC
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _0804A526
	movs r1, #1
_0804A526:
	adds r0, r2, #0
	bl sub_80194BC
	bl sub_804A390
	bl sub_8019914
	pop {r0}
	bx r0
	.align 2, 0
_0804A538: .4byte 0x0202E4E4
_0804A53C: .4byte 0x0202BCEC

