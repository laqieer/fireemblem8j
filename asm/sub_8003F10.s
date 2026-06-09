	.syntax unified
	.section .text.sub_8003F10, "ax", %progbits
@ sub_8003F10 @ JP 0x08003F10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003F10
	.thumb_func
sub_8003F10:
	push {lr}
	b _08003F1E
_08003F14:
	cmp r1, #4
	bne _08003F1C
	adds r0, #1
	b _08003F1E
_08003F1C:
	adds r0, #2
_08003F1E:
	ldrb r1, [r0]
	cmp r1, #1
	bhi _08003F14
	pop {r1}
	bx r1

