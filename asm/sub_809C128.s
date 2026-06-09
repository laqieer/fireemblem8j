	.syntax unified
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set StartArmoryScreen, 0x080B8D68 + 1
	.section .text.sub_809C128, "ax", %progbits
@ sub_809C128 @ JP 0x0809C128 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809C128
	.thumb_func
sub_809C128:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	ldr r1, _0809C144 @ =0x08A94628
	adds r2, r4, #0
	bl StartArmoryScreen
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809C144: .4byte 0x08A94628

