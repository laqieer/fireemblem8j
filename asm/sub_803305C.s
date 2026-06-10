	.syntax unified
	.section .text.sub_803305C, "ax", %progbits
@ sub_803305C @ JP 0x0803305C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803305C
	.thumb_func
sub_803305C:
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r2, _08033090 @ =0x0202BCAC
	movs r6, #0xe
	ldrsh r0, [r2, r6]
	subs r1, r1, r0
	cmn r1, r3
	ble _08033094
	cmp r1, #0x9f
	bgt _08033094
	movs r1, #0xc
	ldrsh r0, [r2, r1]
	subs r0, r5, r0
	cmn r0, r4
	ble _08033094
	cmp r0, #0xef
	bgt _08033094
	movs r0, #1
	b _08033096
	.align 2, 0
_08033090: .4byte 0x0202BCAC
_08033094:
	movs r0, #0
_08033096:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

