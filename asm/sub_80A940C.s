	.syntax unified
	.set GetCharacterData, 0x0801913C + 1
	.section .text.sub_80A940C, "ax", %progbits
@ sub_80A940C @ JP 0x080A940C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A940C
	.thumb_func
sub_80A940C:
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi _080A942C
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A942C
	lsls r1, r4, #4
	ldr r0, _080A9430 @ =0x0203E880
	adds r1, r1, r0
	cmp r1, #0
	bne _080A9434
_080A942C:
	movs r0, #0
	b _080A943A
	.align 2, 0
_080A9430: .4byte 0x0203E880
_080A9434:
	ldr r0, [r1, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
_080A943A:
	pop {r4}
	pop {r1}
	bx r1

