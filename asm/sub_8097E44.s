	.syntax unified
	.set sub_80040B8, 0x080040B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_8097E44, "ax", %progbits
@ sub_8097E44 @ JP 0x08097E44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097E44
	.thumb_func
sub_8097E44:
	push {r4, lr}
	ldr r4, _08097E60 @ =0x020111A4
	bl sub_8009FA8
_08097E4C:
	adds r1, r0, #0
_08097E4E:
	ldrb r0, [r1]
	cmp r0, #0
	beq _08097E6C
	cmp r0, #1
	bne _08097E64
	adds r4, #8
	adds r1, #1
	b _08097E4E
	.align 2, 0
_08097E60: .4byte 0x020111A4
_08097E64:
	adds r0, r4, #0
	bl sub_80040B8
	b _08097E4C
_08097E6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

