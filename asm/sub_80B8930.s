	.syntax unified
	.set ApplyMainMiniAnimHitEffect, 0x0805B734 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set RestartMainMiniAnim, 0x0805B558 + 1
	.section .text.sub_80B8930, "ax", %progbits
@ sub_80B8930 @ JP 0x080B8930 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B8930
	.thumb_func
sub_80B8930:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r0, [r0]
	cmp r0, #8
	bhi _080B89B6
	lsls r0, r0, #2
	ldr r1, _080B8948 @ =_080B894C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B8948: .4byte _080B894C
_080B894C: @ jump table
	.4byte _080B8970 @ case 0
	.4byte _080B897A @ case 1
	.4byte _080B8984 @ case 2
	.4byte _080B8990 @ case 3
	.4byte _080B899C @ case 4
	.4byte _080B89B6 @ case 5
	.4byte _080B89AC @ case 6
	.4byte _080B8990 @ case 7
	.4byte _080B89B6 @ case 8
_080B8970:
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080B89B6
_080B897A:
	ldr r0, _080B8980 @ =0x02000000
	movs r1, #0
	b _080B89A0
	.align 2, 0
_080B8980: .4byte 0x02000000
_080B8984:
	ldr r0, _080B898C @ =0x02000000
	movs r1, #1
	b _080B89A0
	.align 2, 0
_080B898C: .4byte 0x02000000
_080B8990:
	ldr r0, _080B8998 @ =0x02000000
	bl ApplyMainMiniAnimHitEffect
	b _080B89B6
	.align 2, 0
_080B8998: .4byte 0x02000000
_080B899C:
	ldr r0, _080B89A8 @ =0x02000000
	movs r1, #2
_080B89A0:
	strh r1, [r0, #0xa]
	bl RestartMainMiniAnim
	b _080B89B6
	.align 2, 0
_080B89A8: .4byte 0x02000000
_080B89AC:
	ldr r0, _080B89C0 @ =0x02000000
	movs r1, #4
	strh r1, [r0, #0xa]
	bl RestartMainMiniAnim
_080B89B6:
	movs r0, #0
	strh r0, [r4, #0x2a]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B89C0: .4byte 0x02000000

