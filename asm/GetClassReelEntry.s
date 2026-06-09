	.syntax unified
	.section .text.GetClassReelEntry, "ax", %progbits
@ GetClassReelEntry @ JP 0x080B8C80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetClassReelEntry
	.thumb_func
GetClassReelEntry:
	ldr r3, _080B8C94 @ =0x08AB0A44
	ldr r2, _080B8C98 @ =0x08AB0A38
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080B8C94: .4byte 0x08AB0A44
_080B8C98: .4byte 0x08AB0A38

