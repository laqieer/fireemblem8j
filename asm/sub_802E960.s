	.syntax unified
	.set CallGameOverEvent, 0x0800D654 + 1
	.set CheckFlag, 0x080860D0 + 1
	.set CountAvailableBlueUnits, 0x08018D04 + 1
	.set SetFlag, 0x080860A8 + 1
	.set sub_80871B4, 0x080871B4 + 1
	.section .text.sub_802E960, "ax", %progbits
@ sub_802E960 @ JP 0x0802E960 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802E960
	.thumb_func
sub_802E960:
	push {lr}
	movs r0, #0x65
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802E978
	bl CountAvailableBlueUnits
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802E97C
_0802E978:
	bl CallGameOverEvent
_0802E97C:
	bl sub_80871B4
	cmp r0, #0
	bne _0802E98A
	movs r0, #6
	bl SetFlag
_0802E98A:
	pop {r0}
	bx r0
	.align 2, 0

