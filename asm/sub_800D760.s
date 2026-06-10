	.syntax unified
	.set ClearFlag, 0x080860BC + 1
	.set SetFlag, 0x080860A8 + 1
	.section .text.sub_800D760, "ax", %progbits
@ sub_800D760 @ JP 0x0800D760 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D760
	.thumb_func
sub_800D760:
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x18
	cmp r1, #0
	bne _0800D772
	bl ClearFlag
	b _0800D776
_0800D772:
	bl SetFlag
_0800D776:
	pop {r0}
	bx r0
	.align 2, 0

