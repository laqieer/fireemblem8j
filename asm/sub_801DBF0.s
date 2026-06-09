	.syntax unified
	.set GetConvoyItemCount, 0x080314BC + 1
	.set StartMenu, 0x0804F954 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_8031568, 0x08031568 + 1
	.section .text.sub_801DBF0, "ax", %progbits
@ sub_801DBF0 @ JP 0x0801DBF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801DBF0
	.thumb_func
sub_801DBF0:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0801DC1C @ =0x02001F70
	bl GetConvoyItemCount
	strb r0, [r5]
	movs r0, #4
	bl sub_8003508
	bl sub_8031568
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801DC24
	ldrb r0, [r5]
	cmp r0, #0x63
	bhi _0801DC24
	ldr r0, _0801DC20 @ =0x085C55B0
	adds r1, r4, #0
	bl StartMenu
	b _0801DC2C
	.align 2, 0
_0801DC1C: .4byte 0x02001F70
_0801DC20: .4byte 0x085C55B0
_0801DC24:
	ldr r0, _0801DC34 @ =0x085C558C
	adds r1, r4, #0
	bl StartMenu
_0801DC2C:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801DC34: .4byte 0x085C558C

