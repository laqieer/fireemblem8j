	.syntax unified
	.set CheckEkrDragonDead, 0x080727C4 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetEkrDragonStatusAttr, 0x08071FF8 + 1
	.set Proc_End, 0x08002CBC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80796E4, 0x080796E4 + 1
	.set sub_8079BB4, 0x08079BB4 + 1
	.section .text.sub_8078BB8, "ax", %progbits
@ sub_8078BB8 @ JP 0x08078BB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078BB8
	.thumb_func
sub_8078BB8:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetEkrDragonStatusAttr
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	bl GetEkrDragonStatusAttr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	beq _08078C0C
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	beq _08078C0C
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x50]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl CheckEkrDragonDead
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078BFE
	ldr r0, [r4, #0x5c]
	bl sub_80796E4
	b _08078C04
_08078BFE:
	ldr r0, [r4, #0x5c]
	bl sub_8079BB4
_08078C04:
	str r0, [r4, #0x50]
	adds r0, r4, #0
	bl sub_8002DE4
_08078C0C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

