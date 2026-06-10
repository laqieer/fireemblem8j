	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8015474, "ax", %progbits
@ sub_8015474 @ JP 0x08015474 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8015474
	.thumb_func
sub_8015474:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801548C @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq _080154B0
	cmp r0, #0x40
	bgt _08015490
	cmp r0, #0
	beq _08015496
	b _080154B8
	.align 2, 0
_0801548C: .4byte 0x0202BCEC
_08015490:
	cmp r0, #0x80
	beq _080154A0
	b _080154B8
_08015496:
	ldr r0, _0801549C @ =0x085C2F58
	b _080154A2
	.align 2, 0
_0801549C: .4byte 0x085C2F58
_080154A0:
	ldr r0, _080154AC @ =0x085D1E10
_080154A2:
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _080154B8
	.align 2, 0
_080154AC: .4byte 0x085D1E10
_080154B0:
	ldr r0, _080154C4 @ =0x085D1E10
	adds r1, r4, #0
	bl Proc_StartBlocking
_080154B8:
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080154C4: .4byte 0x085D1E10

