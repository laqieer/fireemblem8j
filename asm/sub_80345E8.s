	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80345E8, "ax", %progbits
@ sub_80345E8 @ JP 0x080345E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80345E8
	.thumb_func
sub_80345E8:
	push {lr}
	cmp r0, #0x7f
	bne _080345FC
	ldr r0, _080345F8 @ =0x08A9CA60
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	b _08034606
	.align 2, 0
_080345F8: .4byte 0x08A9CA60
_080345FC:
	bl GetROMChapterStruct
	adds r0, #0x70
	bl sub_8009FA8
_08034606:
	pop {r1}
	bx r1
	.align 2, 0

