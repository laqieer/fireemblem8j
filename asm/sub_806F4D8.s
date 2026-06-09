	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.set sub_8074050, 0x08074050 + 1
	.section .text.sub_806F4D8, "ax", %progbits
@ sub_806F4D8 @ JP 0x0806F4D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806F4D8
	.thumb_func
sub_806F4D8:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _0806F50C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806F510 @ =0x086035FC
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	cmp r5, #1
	beq _0806F524
	cmp r5, #1
	blo _0806F514
	cmp r5, #2
	beq _0806F534
	cmp r5, #3
	beq _0806F548
	b _0806F55E
	.align 2, 0
_0806F50C: .4byte 0x0201774C
_0806F510: .4byte 0x086035FC
_0806F514:
	ldr r0, _0806F51C @ =0x080E4682
	str r0, [r4, #0x48]
	ldr r0, _0806F520 @ =0x08603614
	b _0806F53A
	.align 2, 0
_0806F51C: .4byte 0x080E4682
_0806F520: .4byte 0x08603614
_0806F524:
	ldr r0, _0806F52C @ =0x080E4698
	str r0, [r4, #0x48]
	ldr r0, _0806F530 @ =0x08603614
	b _0806F53A
	.align 2, 0
_0806F52C: .4byte 0x080E4698
_0806F530: .4byte 0x08603614
_0806F534:
	ldr r0, _0806F540 @ =0x080E469E
	str r0, [r4, #0x48]
	ldr r0, _0806F544 @ =0x0860362C
_0806F53A:
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	b _0806F55E
	.align 2, 0
_0806F540: .4byte 0x080E469E
_0806F544: .4byte 0x0860362C
_0806F548:
	ldr r0, _0806F594 @ =0x080E46C0
	str r0, [r4, #0x48]
	ldr r0, _0806F598 @ =0x0860362C
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldrb r0, [r6, #0x14]
	adds r0, r6, r0
	ldrb r1, [r0, #0x14]
	adds r0, r6, #0
	bl sub_8074050
_0806F55E:
	ldr r0, _0806F59C @ =0x0861B0D0
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, _0806F5A0 @ =0x0861BE24
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	ldr r0, _0806F5A4 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806F5B2
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806F5A8
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _0806F5B2
	.align 2, 0
_0806F594: .4byte 0x080E46C0
_0806F598: .4byte 0x0860362C
_0806F59C: .4byte 0x0861B0D0
_0806F5A0: .4byte 0x0861BE24
_0806F5A4: .4byte 0x0203E11C
_0806F5A8:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_0806F5B2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

