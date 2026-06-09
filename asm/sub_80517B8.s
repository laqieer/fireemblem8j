	.syntax unified
	.set sub_8073F28, 0x08073F28 + 1
	.section .text.sub_80517B8, "ax", %progbits
@ sub_80517B8 @ JP 0x080517B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80517B8
	.thumb_func
sub_80517B8:
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080517CA
	movs r0, #0x74
	bl sub_8073F28
_080517CA:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _080517E0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _080517E8 @ =ekrBattle_6
	str r0, [r4, #0xc]
_080517E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080517E8: .4byte 0x080517ED  @ ekrBattle_6

