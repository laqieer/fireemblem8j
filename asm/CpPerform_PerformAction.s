	.syntax unified
	.set AiStartCombatAction, 0x0803A0F4 + 1
	.set AiStartEscapeAction, 0x0803A16C + 1
	.set AiStartStealAction, 0x0803A1AC + 1
	.set sub_803A380, 0x0803A380 + 1
	.set sub_803A3D0, 0x0803A3D0 + 1
	.section .text.CpPerform_PerformAction, "ax", %progbits
@ CpPerform_PerformAction @ JP 0x0803A55C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CpPerform_PerformAction
	.thumb_func
CpPerform_PerformAction:
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0803A574 @ =0x0203A954
	ldrb r0, [r0, #0x11]
	cmp r0, #0x1e
	bne _0803A57C
	ldr r0, _0803A578 @ =sub_803A6EC
	b _0803A662
	.align 2, 0
_0803A574: .4byte 0x0203A954
_0803A578: .4byte 0x0803A6ED  @ sub_803A6EC
_0803A57C:
	ldr r0, _0803A590 @ =0x0203AA90
	ldrb r0, [r0]
	cmp r0, #0xd
	bls _0803A586
	b _0803A664
_0803A586:
	lsls r0, r0, #2
	ldr r1, _0803A594 @ =_0803A598
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803A590: .4byte 0x0203AA90
_0803A594: .4byte _0803A598
_0803A598: @ jump table
	.4byte _0803A5D0 @ case 0
	.4byte _0803A5D8 @ case 1
	.4byte _0803A5E8 @ case 2
	.4byte _0803A5F8 @ case 3
	.4byte _0803A608 @ case 4
	.4byte _0803A610 @ case 5
	.4byte _0803A618 @ case 6
	.4byte _0803A620 @ case 7
	.4byte _0803A628 @ case 8
	.4byte _0803A630 @ case 9
	.4byte _0803A638 @ case 10
	.4byte _0803A640 @ case 11
	.4byte _0803A650 @ case 12
	.4byte _0803A660 @ case 13
_0803A5D0:
	ldr r0, _0803A5D4 @ =sub_803A6EC
	b _0803A662
	.align 2, 0
_0803A5D4: .4byte 0x0803A6ED  @ sub_803A6EC
_0803A5D8:
	ldr r0, _0803A5E4 @ =sub_803A6EC
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl AiStartCombatAction
	b _0803A664
	.align 2, 0
_0803A5E4: .4byte 0x0803A6ED  @ sub_803A6EC
_0803A5E8:
	adds r0, r4, #0
	bl AiStartEscapeAction
	ldr r0, _0803A5F4 @ =sub_803A6F0
	b _0803A662
	.align 2, 0
_0803A5F4: .4byte 0x0803A6F1  @ sub_803A6F0
_0803A5F8:
	adds r0, r4, #0
	bl AiStartStealAction
	ldr r0, _0803A604 @ =sub_803A714
	b _0803A662
	.align 2, 0
_0803A604: .4byte 0x0803A715  @ sub_803A714
_0803A608:
	ldr r0, _0803A60C @ =sub_803A1F4
	b _0803A662
	.align 2, 0
_0803A60C: .4byte 0x0803A1F5  @ sub_803A1F4
_0803A610:
	ldr r0, _0803A614 @ =sub_803A27C
	b _0803A662
	.align 2, 0
_0803A614: .4byte 0x0803A27D  @ sub_803A27C
_0803A618:
	ldr r0, _0803A61C @ =sub_803A2B4
	b _0803A662
	.align 2, 0
_0803A61C: .4byte 0x0803A2B5  @ sub_803A2B4
_0803A620:
	ldr r0, _0803A624 @ =sub_803A2E8
	b _0803A662
	.align 2, 0
_0803A624: .4byte 0x0803A2E9  @ sub_803A2E8
_0803A628:
	ldr r0, _0803A62C @ =sub_803A2EC
	b _0803A662
	.align 2, 0
_0803A62C: .4byte 0x0803A2ED  @ sub_803A2EC
_0803A630:
	ldr r0, _0803A634 @ =sub_803A330
	b _0803A662
	.align 2, 0
_0803A634: .4byte 0x0803A331  @ sub_803A330
_0803A638:
	ldr r0, _0803A63C @ =sub_803A358
	b _0803A662
	.align 2, 0
_0803A63C: .4byte 0x0803A359  @ sub_803A358
_0803A640:
	ldr r0, _0803A64C @ =sub_803A6EC
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl sub_803A380
	b _0803A664
	.align 2, 0
_0803A64C: .4byte 0x0803A6ED  @ sub_803A6EC
_0803A650:
	ldr r0, _0803A65C @ =sub_803A6EC
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl sub_803A3D0
	b _0803A664
	.align 2, 0
_0803A65C: .4byte 0x0803A6ED  @ sub_803A6EC
_0803A660:
	ldr r0, _0803A66C @ =sub_803A408
_0803A662:
	str r0, [r4, #0x2c]
_0803A664:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803A66C: .4byte 0x0803A409  @ sub_803A408

