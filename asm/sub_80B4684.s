	.syntax unified
	.set ChangeBgm, 0x08002938 + 1
	.set MusicProc4Exists, 0x080029BC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80B4684, "ax", %progbits
@ sub_80B4684 @ JP 0x080B4684 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B4684
	.thumb_func
sub_80B4684:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl MusicProc4Exists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080B46AA
	str r0, [sp]
	movs r0, #0x43
	movs r1, #0
	movs r2, #0xc0
	movs r3, #0x18
	bl ChangeBgm
	adds r0, r4, #0
	bl sub_8002DE4
_080B46AA:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

