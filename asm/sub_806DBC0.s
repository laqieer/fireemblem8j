	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.section .text.sub_806DBC0, "ax", %progbits
@ sub_806DBC0 @ JP 0x0806DBC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806DBC0
	.thumb_func
sub_806DBC0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806DC08 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806DC0C @ =0x0860325C
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806DC10 @ =0x080E437C
	str r1, [r0, #0x48]
	ldr r1, _0806DC14 @ =0x08603238
	str r1, [r0, #0x4c]
	ldr r1, _0806DC18 @ =0x08603244
	str r1, [r0, #0x54]
	ldr r1, _0806DC1C @ =0x08603250
	str r1, [r0, #0x58]
	ldr r0, _0806DC20 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806DC30
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806DC24
	movs r0, #1
	movs r1, #0x28
	b _0806DC3E
	.align 2, 0
_0806DC08: .4byte 0x0201774C
_0806DC0C: .4byte 0x0860325C
_0806DC10: .4byte 0x080E437C
_0806DC14: .4byte 0x08603238
_0806DC18: .4byte 0x08603244
_0806DC1C: .4byte 0x08603250
_0806DC20: .4byte 0x0203E11C
_0806DC24:
	ldr r1, _0806DC2C @ =0x0000FFE8
	movs r0, #1
	b _0806DC3E
	.align 2, 0
_0806DC2C: .4byte 0x0000FFE8
_0806DC30:
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806DC46
	movs r0, #1
	movs r1, #0x10
_0806DC3E:
	movs r2, #0
	bl BG_SetPosition
	b _0806DC50
_0806DC46:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_0806DC50:
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

