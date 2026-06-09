	.syntax unified
	.set CheckEkrDragonSkipTransfer, 0x080727E4 + 1
	.set EfxDracoZombiePrepareTSA, 0x0807223C + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetEkrDragonStatusAttr, 0x08071FF8 + 1
	.set SetAnimStateHidden, 0x0805B0FC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80724B0, "ax", %progbits
@ sub_80724B0 @ JP 0x080724B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80724B0
	.thumb_func
sub_80724B0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetEkrDragonStatusAttr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080724F0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x5c]
	bl CheckEkrDragonSkipTransfer
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080724EA
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateHidden
	movs r0, #0
	movs r1, #0
	movs r2, #1
	bl EfxDracoZombiePrepareTSA
_080724EA:
	adds r0, r4, #0
	bl sub_8002DE4
_080724F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

