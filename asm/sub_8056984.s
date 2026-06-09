	.syntax unified
	.section .text.sub_8056984, "ax", %progbits
@ sub_8056984 @ JP 0x08056984 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056984
	.thumb_func
sub_8056984:
	push {r4, lr}
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r4, r2, #0x10
	cmp r0, #0
	bne _080569AC
	ldr r2, _080569A8 @ =0x02000000
	ldr r3, [r2]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	strh r1, [r3, #2]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	strh r0, [r3, #4]
	ldr r3, [r2, #4]
	b _080569BE
	.align 2, 0
_080569A8: .4byte 0x02000000
_080569AC:
	ldr r2, _080569C8 @ =0x02000000
	ldr r3, [r2, #8]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	strh r1, [r3, #2]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	strh r0, [r3, #4]
	ldr r3, [r2, #0xc]
_080569BE:
	strh r1, [r3, #2]
	strh r0, [r3, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080569C8: .4byte 0x02000000

