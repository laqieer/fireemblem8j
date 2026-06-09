	.syntax unified
	.set AnimClearAll, 0x08004DC0 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8050AD4, 0x08050AD4 + 1
	.set sub_8052E7C, 0x08052E7C + 1
	.set sub_807878C, 0x0807878C + 1
	.section .text.sub_8078750, "ax", %progbits
@ sub_8078750 @ JP 0x08078750 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078750
	.thumb_func
sub_8078750:
	push {lr}
	bl sub_8050AD4
	bl AnimClearAll
	bl sub_8052E7C
	ldr r1, _08078770 @ =0x02017744
	str r0, [r1]
	bl sub_807878C
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0
	.align 2, 0
_08078770: .4byte 0x02017744

