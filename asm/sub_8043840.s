	.syntax unified
	.section .text.sub_8043840, "ax", %progbits
@ GetLATeamListHelpTextId @ JP 0x08043840 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetLATeamListHelpTextId
	.thumb_func
GetLATeamListHelpTextId:
	push {lr}
	adds r3, r0, #0
	ldr r2, _08043860 @ =0x085D33A8
	ldr r0, _08043864 @ =0x0203DA20
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r2, [r0]
	cmp r1, #1
	beq _08043868
	ldr r0, [r3, #0x3c]
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	b _0804387A
	.align 2, 0
_08043860: .4byte 0x085D33A8
_08043864: .4byte 0x0203DA20
_08043868:
	ldr r0, [r3, #0x3c]
	cmp r0, #0
	beq _08043878
	ldr r0, _08043874 @ =0x000006CE
	b _0804387A
	.align 2, 0
_08043874: .4byte 0x000006CE
_08043878:
	ldr r0, _08043880 @ =0x000006CD
_0804387A:
	pop {r1}
	bx r1
	.align 2, 0
_08043880: .4byte 0x000006CD

