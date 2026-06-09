	.syntax unified
	.set WfxCloudsOffsetGraphicsEffect, 0x08030940 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_80130D8, 0x080130D8 + 1
	.section .text.sub_80309D4, "ax", %progbits
@ sub_80309D4 @ JP 0x080309D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80309D4
	.thumb_func
sub_80309D4:
	push {r4, lr}
	ldr r4, _080309F0 @ =0x020027DC
	bl sub_8000CD8
	adds r1, r0, #0
	movs r0, #7
	ands r1, r0
	cmp r1, #7
	bhi _08030A44
	lsls r0, r1, #2
	ldr r1, _080309F4 @ =_080309F8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080309F0: .4byte 0x020027DC
_080309F4: .4byte _080309F8
_080309F8: @ jump table
	.4byte _08030A18 @ case 0
	.4byte _08030A44 @ case 1
	.4byte _08030A20 @ case 2
	.4byte _08030A44 @ case 3
	.4byte _08030A26 @ case 4
	.4byte _08030A44 @ case 5
	.4byte _08030A2C @ case 6
	.4byte _08030A38 @ case 7
_08030A18:
	adds r0, r4, #0
	bl WfxCloudsOffsetGraphicsEffect
	b _08030A44
_08030A20:
	movs r1, #0xe0
	lsls r1, r1, #1
	b _08030A30
_08030A26:
	movs r1, #0xe0
	lsls r1, r1, #2
	b _08030A30
_08030A2C:
	movs r1, #0xa8
	lsls r1, r1, #3
_08030A30:
	adds r0, r4, r1
	bl WfxCloudsOffsetGraphicsEffect
	b _08030A44
_08030A38:
	ldr r1, _08030A4C @ =0x06010240
	adds r0, r4, #0
	movs r2, #0xe
	movs r3, #4
	bl sub_80130D8
_08030A44:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030A4C: .4byte 0x06010240

