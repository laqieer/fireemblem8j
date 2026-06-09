	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_80040B8, 0x080040B8 + 1
	.section .text.sub_8003F98, "ax", %progbits
@ sub_8003F98 @ JP 0x08003F98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003F98
	.thumb_func
sub_8003F98:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	bne _08003FB0
	ldr r1, _08003FAC @ =0x080DC3F0
	bl sub_80040B8
	b _08003FE0
	.align 2, 0
_08003FAC: .4byte 0x080DC3F0
_08003FB0:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #0x18
	ldr r1, _08003FE8 @ =0x4F820000
	adds r0, r0, r1
	asrs r0, r0, #0x10
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	adds r0, r5, #0
	mov r1, sp
	bl sub_80040B8
	ldrb r0, [r5, #2]
	subs r0, #0x10
	strb r0, [r5, #2]
	cmp r4, #0
	bne _08003FB0
_08003FE0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08003FE8: .4byte 0x4F820000

