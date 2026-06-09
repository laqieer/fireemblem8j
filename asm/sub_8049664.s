	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8003BE8, 0x08003BE8 + 1
	.set sub_804F8E0, 0x0804F8E0 + 1
	.section .text.sub_8049664, "ax", %progbits
@ sub_8049664 @ JP 0x08049664 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8049664
	.thumb_func
sub_8049664:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_804F8E0
	ldr r0, _08049688 @ =0x0203DB60
	ldr r1, _0804968C @ =0x06001800
	movs r2, #0xc0
	movs r3, #0
	bl sub_8003BE8
	ldr r0, _08049690 @ =0x085D4010
	adds r1, r4, #0
	bl Proc_StartBlocking
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049688: .4byte 0x0203DB60
_0804968C: .4byte 0x06001800
_08049690: .4byte 0x085D4010

