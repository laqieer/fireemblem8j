	.syntax unified
	.set IsMainMiniAnimRoundEnd, 0x0805B710 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80B89C4, "ax", %progbits
@ sub_80B89C4 @ JP 0x080B89C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B89C4
	.thumb_func
sub_80B89C4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #7
	bhi _080B8A3C
	lsls r0, r0, #2
	ldr r1, _080B89DC @ =_080B89E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B89DC: .4byte _080B89E0
_080B89E0: @ jump table
	.4byte _080B8A00 @ case 0
	.4byte _080B8A00 @ case 1
	.4byte _080B8A00 @ case 2
	.4byte _080B8A00 @ case 3
	.4byte _080B8A06 @ case 4
	.4byte _080B8A00 @ case 5
	.4byte _080B8A00 @ case 6
	.4byte _080B8A24 @ case 7
_080B8A00:
	ldr r0, [r4, #0x38]
	adds r0, #2
	b _080B8A1A
_080B8A06:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	ldr r1, [r4, #0x38]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r1, #1]
	cmp r0, r2
	blo _080B8A3C
	adds r0, r1, #2
_080B8A1A:
	str r0, [r4, #0x38]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080B8A3C
_080B8A24:
	ldr r0, _080B8A44 @ =0x02000000
	bl IsMainMiniAnimRoundEnd
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B8A3C
	ldr r0, [r4, #0x38]
	adds r0, #2
	str r0, [r4, #0x38]
	adds r0, r4, #0
	bl sub_8002DE4
_080B8A3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8A44: .4byte 0x02000000

