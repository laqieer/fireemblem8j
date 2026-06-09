	.syntax unified
	.section .text.EfxPartsofScroll2HBlank, "ax", %progbits
@ EfxPartsofScroll2HBlank @ JP 0x08076CAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EfxPartsofScroll2HBlank
	.thumb_func
EfxPartsofScroll2HBlank:
	push {r4, r5, lr}
	ldr r0, _08076CE8 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08076CE0
	ldr r3, _08076CEC @ =0x0400001A
	ldr r4, _08076CF0 @ =0x03003020
	ldr r2, _08076CF4 @ =0x0201FB34
	ldr r1, [r2]
	ldrh r0, [r1]
	ldrh r5, [r4, #0x26]
	adds r0, r0, r5
	strh r0, [r3]
	adds r1, #2
	str r1, [r2]
	subs r3, #4
	ldr r2, _08076CF8 @ =0x0201FDC0
	ldr r1, [r2]
	ldrh r0, [r1]
	ldrh r4, [r4, #0x22]
	adds r0, r0, r4
	strh r0, [r3]
	adds r1, #2
	str r1, [r2]
_08076CE0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076CE8: .4byte 0x04000004
_08076CEC: .4byte 0x0400001A
_08076CF0: .4byte 0x03003020
_08076CF4: .4byte 0x0201FB34
_08076CF8: .4byte 0x0201FDC0

