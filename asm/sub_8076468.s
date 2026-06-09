	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8073E74, 0x08073E74 + 1
	.set sub_8073F94, 0x08073F94 + 1
	.set sub_8076A58, 0x08076A58 + 1
	.section .text.sub_8076468, "ax", %progbits
@ sub_8076468 @ JP 0x08076468 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8076468
	.thumb_func
sub_8076468:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807647C
	adds r0, r5, #0
	bl sub_8002DE4
	b _080764B4
_0807647C:
	ldr r0, _080764BC @ =EfxPartsofScroll2HBlank
	bl SetPrimaryHBlankHandler
	ldr r4, _080764C0 @ =0x020200D8
	ldr r0, [r4]
	bl Proc_End
	bl sub_8076A58
	str r0, [r4]
	ldr r4, _080764C4 @ =0x000002CD
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl sub_8073E74
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #0
	bl sub_8073F94
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #8
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl sub_8002DE4
_080764B4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080764BC: .4byte 0x08076CAD  @ EfxPartsofScroll2HBlank
_080764C0: .4byte 0x020200D8
_080764C4: .4byte 0x000002CD

