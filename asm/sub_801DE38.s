	.syntax unified
	.set AddItemToConvoy, 0x080314E0 + 1
	.section .text.sub_801DE38, "ax", %progbits
@ sub_801DE38 @ JP 0x0801DE38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801DE38
	.thumb_func
sub_801DE38:
	push {r4, lr}
	ldr r4, _0801DE50 @ =0x0202BCAC
	ldrh r0, [r4, #0x2c]
	bl AddItemToConvoy
	ldr r1, _0801DE54 @ =0x0203A954
	ldrh r0, [r4, #0x2c]
	strh r0, [r1, #6]
	movs r0, #0x37
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801DE50: .4byte 0x0202BCAC
_0801DE54: .4byte 0x0203A954

