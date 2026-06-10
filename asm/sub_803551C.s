	.syntax unified
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.section .text.sub_803551C, "ax", %progbits
@ sub_803551C @ JP 0x0803551C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803551C
	.thumb_func
sub_803551C:
	push {lr}
	ldr r0, _08035530 @ =0x0202BCAC
	adds r0, #0x38
	movs r1, #8
	strb r1, [r0]
	ldr r0, _08035534 @ =SubtitleHelpDarkenerOnHBlank
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0
	.align 2, 0
_08035530: .4byte 0x0202BCAC
_08035534: .4byte 0x080354B5  @ SubtitleHelpDarkenerOnHBlank

