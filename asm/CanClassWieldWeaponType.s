	.syntax unified
	.section .text.CanClassWieldWeaponType, "ax", %progbits
@ CanClassWieldWeaponType @ JP 0x08017834 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CanClassWieldWeaponType
	.thumb_func
CanClassWieldWeaponType:
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r2, #0
	bgt _08017846
	movs r0, #0
	b _08017850
_08017846:
	movs r0, #0x54
	adds r1, r2, #0
	muls r1, r0, r1
	ldr r0, _08017860 @ =0x0885B668
	adds r0, r1, r0
_08017850:
	adds r0, #0x2c
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08017864
	movs r0, #0
	b _08017866
	.align 2, 0
_08017860: .4byte 0x0885B668
_08017864:
	movs r0, #1
_08017866:
	pop {r1}
	bx r1
	.align 2, 0

