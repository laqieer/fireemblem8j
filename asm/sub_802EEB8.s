	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set GetUnitMu, 0x0807BFCC + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8026F38, 0x08026F38 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_807B4C8, 0x0807B4C8 + 1
	.section .text.sub_802EEB8, "ax", %progbits
@ sub_802EEB8 @ JP 0x0802EEB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802EEB8
	.thumb_func
sub_802EEB8:
	push {lr}
	ldr r0, _0802EEE0 @ =0x0203A954
	ldrb r0, [r0, #0xd]
	bl GetUnit
	bl GetUnitMu
	bl sub_807B4C8
	bl RefreshEntityBmMaps
	bl sub_8019914
	bl sub_8027144
	bl sub_8026F38
	pop {r1}
	bx r1
	.align 2, 0
_0802EEE0: .4byte 0x0203A954

