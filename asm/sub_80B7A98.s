	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set __udivsi3, 0x080D67D0 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80B7A98, "ax", %progbits
@ ClassIntro_LoopOut @ JP 0x080B7A98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ClassIntro_LoopOut
	.thumb_func
ClassIntro_LoopOut:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x14
	bne _080B7AAA
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl Proc_Goto
_080B7AAA:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x4f
	bls _080B7ABA
	adds r0, r4, #0
	bl sub_8002DE4
	movs r0, #0
	b _080B7AF0
_080B7ABA:
	ldrh r5, [r4, #0x2a]
	adds r0, r5, #0
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B7AEC
	adds r0, r5, #0
	movs r1, #6
	bl __udivsi3
	ldr r1, [r4, #0x64]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1, #0xc]
	cmp r0, r1
	bhs _080B7AEC
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x34
	adds r1, r1, r0
	ldr r0, [r1]
	bl sub_8002DE4
_080B7AEC:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
_080B7AF0:
	strh r0, [r4, #0x2a]
	pop {r4, r5}
	pop {r0}
	bx r0

