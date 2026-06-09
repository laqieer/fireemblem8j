	.syntax unified
	.set AddItemToConvoy, 0x080314E0 + 1
	.section .text.sub_801DC74, "ax", %progbits
@ sub_801DC74 @ JP 0x0801DC74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801DC74
	.thumb_func
sub_801DC74:
	push {lr}
	ldr r0, _0801DC84 @ =0x0202BCAC
	ldrh r0, [r0, #0x2e]
	bl AddItemToConvoy
	pop {r1}
	bx r1
	.align 2, 0
_0801DC84: .4byte 0x0202BCAC

