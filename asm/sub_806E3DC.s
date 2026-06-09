	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_806E3DC, "ax", %progbits
@ sub_806E3DC @ JP 0x0806E3DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806E3DC
	.thumb_func
sub_806E3DC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806E420 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806E424 @ =0x08603314
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806E428 @ =0x080E43DC
	str r1, [r0, #0x48]
	ldr r1, _0806E42C @ =0x086032CC
	str r1, [r0, #0x4c]
	ldr r1, _0806E430 @ =0x086032F0
	str r1, [r0, #0x54]
	ldr r0, _0806E434 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806E448
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806E438
	movs r0, #1
	movs r1, #0x18
	b _0806E43C
	.align 2, 0
_0806E420: .4byte 0x0201774C
_0806E424: .4byte 0x08603314
_0806E428: .4byte 0x080E43DC
_0806E42C: .4byte 0x086032CC
_0806E430: .4byte 0x086032F0
_0806E434: .4byte 0x0203E11C
_0806E438:
	ldr r1, _0806E444 @ =0x0000FFE8
	movs r0, #1
_0806E43C:
	movs r2, #0
	bl BG_SetPosition
	b _0806E452
	.align 2, 0
_0806E444: .4byte 0x0000FFE8
_0806E448:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_0806E452:
	ldr r0, _0806E468 @ =0x0872A61C
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, _0806E46C @ =OnHBlank_0
	bl SetPrimaryHBlankHandler
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E468: .4byte 0x0872A61C
_0806E46C: .4byte 0x0806D3AD  @ OnHBlank_0

